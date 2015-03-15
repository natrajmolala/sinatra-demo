require 'yaml'
require 'json'

module Conf
  @config = nil

  def self.initialize env
    return if @config

    env = env.to_sym unless env.nil?

    @config = {}
    @config.merge!(YAML::load(File.read("#{File.dirname(__FILE__)}/envs/#{env}.yml")))
    @config[:env] = env

  end

  def self.config
    @config
  end

  # access by method = key name
  def self.method_missing(sym, args=nil, &block)
    @config[sym]
  end
end