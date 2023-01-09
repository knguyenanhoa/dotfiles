require 'irb/completion'

ActiveRecord::Base.logger.level = 1 if defined? ActiveRecord

if defined? Rails
  banner = if Rails.env.production?
             "\e[41;97;1m #{Rails.env} \e[0m "
           else
             "\e[42;97;1m #{Rails.env} \e[0m "
           end
  IRB.conf[:PROMPT][:CUSTOM] = IRB.conf[:PROMPT][:DEFAULT].merge(
    PROMPT_I: banner + IRB.conf[:PROMPT][:DEFAULT][:PROMPT_I],
  )
  IRB.conf[:PROMPT_MODE] = :CUSTOM
end

def ws
  w = AutoWorkshop.first
  return w
end

def wjc(job_card_name)
  w = ws
  w.update job_card_template: job_card_name
end

def winv(invoice_name)
  w = ws
  w.update invoice_template: invoice_name
end

def pbcopy content
  `echo "#{content}" | pbcopy`
  puts 'copied to clipboard'
end

def bm
  # From http://blog.evanweaver.com/articles/2006/12/13/benchmark/
  # Call benchmark { } with any block and you get the wallclock
  # runtime as well as a percent change + or - from the last run
  cur = Time.now
  result = yield
  print "#{cur = Time.now - cur} seconds"
  puts " (#{(cur / $last_benchmark * 100).to_i - 100}%
  change)" rescue puts ""
  $last_benchmark = cur
  result
end

class Object
  def locals
    (methods - Object.instance_methods).sort
  end
end
