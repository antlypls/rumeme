GEM_ROOT = File.expand_path("../../", __FILE__)
$:.unshift File.join(GEM_ROOT, "lib")

require 'rumeme'

require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir     = 'spec/cassettes'
  c.hook_into                  :webmock
  c.configure_rspec_metadata!
  c.debug_logger = $stdout
end

RSpec.configure do |c|
  # c.extend VCR::RSpec::Macros
  c.treat_symbols_as_metadata_keys_with_true_values = true
end
