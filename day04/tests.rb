# frozen_string_literal: true

require "minitest/autorun"
require "minitest/pride"
require_relative "code"

def input
  file_path = File.join(File.dirname(__FILE__), "input")
  File.open(file_path).read.split("\n")
end

def example_input
  [
    "ecl:gry pid:860033327 eyr:2020 hcl:#fffffd",
    "byr:1937 iyr:2017 cid:147 hgt:183cm",
    "",
    "iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884",
    "hcl:#cfa07d byr:1929",
    "",
    "hcl:#ae17e1 iyr:2013",
    "eyr:2024",
    "ecl:brn pid:760753108 byr:1931",
    "hgt:179cm",
    "",
    "hcl:#cfa07d eyr:2025 pid:166559648",
    "iyr:2011 ecl:brn hgt:59in"
  ]
end

def invalid_passports
  [
    "eyr:1972 cid:100",
    "hcl:#18171d ecl:amb hgt:170 pid:186cm iyr:2018 byr:1926",
    "",
    "iyr:2019",
    "hcl:#602927 eyr:1967 hgt:170cm",
    "ecl:grn pid:012533040 byr:1946",
    "",
    "hcl:dab227 iyr:2012",
    "ecl:brn hgt:182cm pid:021572410 eyr:2020 byr:1992 cid:277",
    "",
    "hgt:59cm ecl:zzz",
    "eyr:2038 hcl:74454a iyr:2023",
    "pid:3556412378 byr:2007"
  ]
end

def valid_passports
  [
    "pid:087499704 hgt:74in ecl:grn iyr:2012 eyr:2030 byr:1980",
    "hcl:#623a2f",
    "",
    "eyr:2029 ecl:blu cid:129 byr:1989",
    "iyr:2014 pid:896056539 hcl:#a97842 hgt:165cm",
    "",
    "hcl:#888785",
    "hgt:164cm byr:2001 iyr:2015 cid:88",
    "pid:545766238 ecl:hzl",
    "eyr:2022",
    "",
    "iyr:2010 hgt:158cm hcl:#b6652a ecl:blu byr:1944 eyr:2021 pid:093154719"
  ]
end

class TestDay < Minitest::Test
  def test_part_one_example
    assert_equal(2, part_one(example_input))
  end

  def test_part_one
    assert_equal(239, part_one(input))
  end

  def test_part_two_with_valid_passports
    assert_equal(4, part_two(valid_passports))
  end

  def test_part_two_with_invalid_passports
    assert_equal(0, part_two(invalid_passports))
  end

  def test_valid_birth_year
    assert_equal(true, valid_birth_year?("byr:2002"))
  end

  def test_invalid_birth_year
    assert_equal(false, valid_birth_year?("byr:2003"))
  end

  def test_valid_height
    assert_equal(true, valid_height?("hgt:60in"))
    assert_equal(true, valid_height?("hgt:190cm"))
  end

  def test_invalid_height
    assert_equal(false, valid_height?("hgt:190"))
    assert_equal(false, valid_height?("hgt:190in"))
  end

  def test_valid_hair_color
    assert_equal(true, valid_hair_color?("hcl:#123abc"))
  end

  def test_invalid_hair_color
    assert_equal(false, valid_hair_color?("hcl:#123abz"))
    assert_equal(false, valid_hair_color?("hcl:123abc"))
  end

  def test_valid_eye_color
    assert_equal(true, valid_eye_color?("ecl:brn"))
  end

  def test_invalid_eye_color
    assert_equal(false, valid_eye_color?("ecl:wat"))
  end

  def test_valid_passport_id
    assert_equal(true, valid_passport_id?("pid:000000001"))
  end

  def test_invalid_passport_id
    assert_equal(false, valid_passport_id?("pid:0123456789"))
  end

  def test_part_two
    assert_equal(188, part_two(input))
  end
end
