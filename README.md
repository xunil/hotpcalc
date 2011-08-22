# Summary
Simple Ruby script to calculate the sequence position for an OATH HOTP token, given the seed and two sequential token outputs.  Requires the [HOTP](http://rubygems.org/gems/HOTP) gem.

# Usage

    hotpcalc.rb <secret> <code1> <code2>

*Secret* should be 40 hex digits, case is irrelevant.


