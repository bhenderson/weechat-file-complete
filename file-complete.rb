require 'weechat'
include Weechat

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

  Hooks::Completion.hook @script[:name], "Add completions from a file" do |buffer, completions|
    next unless @config.enabled

    read_files do |line|
      line.sub! /#.*/, ""
      line.strip!
      completions.add(line, false, :sort)
    end
  end

  Core.puts "Remember to add %(#{@script[:name]}) to weechat.completion.default_template"
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
