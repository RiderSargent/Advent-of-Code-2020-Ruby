# frozen_string_literal: true

def part_one(input)
  passport = []
  valid_passports = []
  input << ''

  input.each do |line|
    if line.empty?
      valid_passports << passport if valid? passport
      passport = []
    else
      passport << line
    end
  end

  valid_passports.length
end

def valid?(passport)
  entire_passport = passport.join

  entire_passport.include?('byr:') &&
    entire_passport.include?('iyr:') &&
    entire_passport.include?('eyr:') &&
    entire_passport.include?('hgt:') &&
    entire_passport.include?('hcl:') &&
    entire_passport.include?('ecl:') &&
    entire_passport.include?('pid:')
end

