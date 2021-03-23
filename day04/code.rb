# frozen_string_literal: true

def part_one(input)
  parse_passports(input).count { |p| valid_fields? p }
end

def part_two(input)
  parse_passports(input).count { |p| valid_values? p }
end

private

def parse_passports(input)
  input << ""
  passport = []
  passports = []

  input.each do |line|
    if line.empty?
      passports << passport.join(" ")
      passport = []
    else
      passport << line
    end
  end

  passports
end

def valid_fields?(passport)
  [
    passport.include?("byr:"),
    passport.include?("iyr:"),
    passport.include?("eyr:"),
    passport.include?("hgt:"),
    passport.include?("hcl:"),
    passport.include?("ecl:"),
    passport.include?("pid:")
  ].all?
end

def valid_values?(passport)
  [
    valid_birth_year?(passport),
    valid_issue_year?(passport),
    valid_expiration_year?(passport),
    valid_height?(passport),
    valid_hair_color?(passport),
    valid_eye_color?(passport),
    valid_passport_id?(passport)
  ].all?
end

def valid_birth_year?(passport)
  passport.match(/byr:(\d{4})/) do |v|
    v[1].to_i >= 1920 && v[1].to_i <= 2002
  end
end

def valid_issue_year?(passport)
  passport.match(/iyr:(\S+)/) do |v|
    v[1].to_i >= 2010 && v[1].to_i <= 2020
  end
end

def valid_expiration_year?(passport)
  passport.match(/eyr:(\S+)/) do |v|
    v[1].to_i >= 2020 && v[1].to_i <= 2030
  end
end

def valid_height?(passport)
  !!passport.match(/hgt:(\S+)/) do |v|
    h, units = v[1].match(/(\d+)(in|cm)/)&.values_at(1, 2)
    case units
    when "cm"
      h.to_i >= 150 && h.to_i <= 193
    when "in"
      h.to_i >= 59 && h.to_i <= 76
    end
  end
end

def valid_hair_color?(passport)
  !!passport.match(/hcl:#([0-9a-f]{6})/)
end

def valid_eye_color?(passport)
  passport.match(/ecl:(\S{3})/) do |v|
    %w[amb blu brn gry grn hzl oth].include? v[1]
  end
end

def valid_passport_id?(passport)
  passport.match(/pid:(\S+)/) do |v|
    v[1].length == 9
  end
end
