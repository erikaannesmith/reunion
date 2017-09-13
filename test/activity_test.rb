require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test

  def test_it_exists
    activity = Activity.new("rafting")

    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("rafting")

    assert_equal "rafting", activity.name_of_activity
  end

  def test_total_cost
    activity = Activity.new("rafting")
    activity.add_participant("Erika", "25")
    activity.add_participant("Katy", "25")
    activity.add_participant("Emily", "25")

    assert_equal 75, activity.total_cost
  end

  def test_split_cost
    activity = Activity.new("rafting")
    activity.add_participant("Erika", "25")
    activity.add_participant("Katy", "25")
    activity.add_participant("Emily", "25")

    assert_equal 25, activity.split_cost
  end

  def test_find_out_owed_or_owes
    activity = Activity.new("rafting")
    activity.add_participant("Erika", "15")
    activity.add_participant("Katy", "25")
    activity.add_participant("Emily", "35")

    assert_equal 10, activity.balance("Erika")
    assert_equal -10, activity.balance("Emily")
  end

end
