module Usagewatch
  # Show the current http connections on 80 port
  def self.uw_httpconns
    `netstat -an | grep :80 |wc -l`.to_i
  end

  # Show the percentage of Active Memory used
  def self.uw_memused
    if File.exists?("/proc/meminfo")
      File.open("/proc/meminfo", "r") do |file|
        @result = file.read
      end
    end

    @memstat = @result.split("\n").collect{|x| x.strip}
    @memtotal = @memstat[0].gsub(/[^0-9]/, "")
    @memactive = @memstat[5].gsub(/[^0-9]/, "")
    @memactivecalc = (@memactive.to_f * 100) / @memtotal.to_f
    @memusagepercentage = @memactivecalc.round

    { memtotal: @memtotal.to_f / 1024.0,
      memactive: @memactive.to_f / 1024.0,
      memused: @memusagepercentage}
  end

  def self.uw_diskused_perc
    df, total, used  = `df -kl`, 0.0, 0.0
    df.each_line.with_index do |line, line_index|
      line = line.split(" ")
      next if line_index.eql? 0 or line[0] =~ /localhost/ #ignore backup filesystem
      total  += to_gb line[1].to_f
      used   += to_gb line[2].to_f
    end
    { used: used.round(2),
      total: total.round(2),
      diskused_perc: ((used.round(2)/total.round(2)) * 100).round(2)}
  end

  private

  def self.to_gb(bytes)
    (bytes/1024)/1024
  end

end
