guard :rspec, all_after_pass: true, all_on_start: true do
  watch(%r(^spec/.+_spec\.rb$))
  watch(%r(^lib/(.+)\.rb$))          { |m| "spec/#{m[1].sub(%r(\Amiddleman-bootstrap-navbar/), '')}_spec.rb" }
  watch('spec/spec_helper.rb')       { 'spec' }
  watch(%r(^spec/support/(.+)\.rb$)) { 'spec' }
end
