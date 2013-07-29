module Usagewatch

  # Show disk used in GB
  def self.uw_diskused
    df = `df -kl`
    sum = 0.00
    df.each_line.with_index do |line, line_index|
      next if line_index.eql? 0
      line = line.split(" ")
      next if line[0] =~ /localhost/  #ignore backup filesystem
      sum += ((line[2].to_f)/1024)/1024
    end
    sum.round(2)
  end

  # Show the percentage of disk used.
  def self.uw_diskused_perc
    df, total, used  = `df -kl`, 0.0, 0.0
    df.each_line.with_index do |line, line_index|
      line = line.split(" ")
      next if line_index.eql? 0 or line[0] =~ /localhost/ #ignore backup filesystem
      total  += to_gb line[3].to_f
      used   += to_gb line[2].to_f
    end
    ((used/total) * 100).round(2)
  end

  # Show the percentage of cpu used
  def self.uw_cpuused
    top = `top -l1 | awk '/CPU usage/'`
    top = top.gsub(/[\,a-zA-Z:]/, "").split(" ")
    top[0].to_f
  end

  # return hash of top ten proccesses by cpu consumption
  # example [["apache2", 12.0], ["passenger", 13.2]]
  def self.uw_cputop
    top %w"$11 $3"
  end

  # todo
  #def uw_tcpused
  #
  #end

  # todo
  #def uw_udpused
  #
  #end

  # return hash of top ten proccesses by mem consumption
  # example [["apache2", 12.0], ["passenger", 13.2]]
  def self.uw_memtop
    top %w"$11 $4"
  end

  # Percentage of mem used
  def self.uw_memused
    top = `top -l1 | awk '/PhysMem/'`
    top = top.gsub(/[\.\,a-zA-Z:]/, "").split(" ").reverse
    ((top[1].to_f / (top[0].to_f + top[1].to_f)) * 100).round(2)
  end

  # Show the average of load in the last minute
  def self.uw_load
    iostat = `iostat -w1 -c 2 | awk '{print $7}'`
    cpu = 0.0
    iostat.each_line.with_index do |line, line_index|
      next if line_index.eql? 0 or  line_index.eql? 1 or  line_index.eql? 2
      cpu = line.split(" ").last.to_f.round(2)
    end
    cpu
  end

  #todo
  #def uw_bandrx
  #
  #end

  #todo
  #def uw_bandtx
  #
  #end

  #todo
  #def uw_diskioreads
  #
  #end

  #todo
  #def uw_diskiowrites
  #
  #end

  # Show the current http connections on 80 port
  def self.uw_httpconns
    `netstat -an | grep :80 |wc -l`.to_i
  end

  private


  def self.top(lines)
    ps = `ps aux | awk '{print #{lines.join(", ")}}' | sort -k2nr  | head -n 10`
    array = []
    ps.each_line do |line|
      line = line.chomp.split(" ")
      array << [line.first.gsub(/[\[\]]/, "").split("/").last, line.last]
    end
    array
  end

  def self.to_gb(bytes)
    (bytes/1024)/1024
  end
end