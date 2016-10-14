require 'weechat'
include Weechat
include Script::Skeleton
include Weechat::Helper

@script = {
  name: "file-complete",
  author: "Brian Henderson <henderson.bj@gmail.com>",
  version: "0.01",
  license: "GPL3",
  description: "Adds autocompletion from a file.",
}

@config = Script::Config.new(
  'enabled' => [Boolean, true],
  'glob' => [String, "~/.weechat/file-complete/*"],
)

def setup
  Command.hook "/file-complete", "list out the current completions" do |buffer, message|
    read_files do |line|
      buffer.puts line if line.start_with? message
    end
  end

  Weechat.hook_completion @script[:name], "Add completions from a file", "complete", ""
end

def read_files
  Dir.glob(File.expand_path @config.glob).each do |file|
    File.open(file) do |file|
      file.each_line do |line|
        next if line =~ /\A#/
        line.chomp!
        yield line
      end
    end
  end
end

def complete(data, completion_name, buffer, completion)
  Utilities.evaluate_call do
    next unless @config.enabled

    read_files do |line|
      line.sub! /#.*/, ""
      line.strip!
      Weechat.hook_completion_list_add(completion, line, 0, Weechat::WEECHAT_LIST_POS_SORT)
    end
  end
end
