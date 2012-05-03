# encoding: utf-8

require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase

  def setup
    @event = Hashie::Mash.new
  end

  test "interval helper: 22 марта 2012 (eql time)" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-22T00:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>"
  end

  test "interval helper: 22 марта 2012" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-22T23:59:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>"
  end

  test "interval helper: 22 марта 2012 (zero first time)" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-22T08:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>"
  end

  test "interval helper: 22 марта 2012, 08:00 (eql time)" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T08:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00"
  end

  test "interval helper: 22 марта 2012, 08:00" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T23:59:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00"
  end

  test "interval helper:  22 марта 2012, 08:00 - 12:00" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T12:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00 &ndash; 12:00"
  end

  test "interval helper: 22 марта 2012, 08:00 (without end time)" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-22T23:59:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00"
  end

  test "interval helper:  22 марта 2012, 08:00 - 23 марта 2012, 08:00" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T08:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00 &ndash; <span class=\"nobr\">23 марта 2012</span>, 08:00"
  end

  test "interval helper: 22 марта 2012 08:12 - 23 марта 2012 12:00" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T12:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00 &ndash; <span class=\"nobr\">23 марта 2012</span>, 12:00"
  end

  test "interval helper: 22 марта 2012 - 23 марта 2012" do
    @event.since = "2012-03-22T00:00:00+07:00"
    @event.until = "2012-03-23T23:59:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span> &ndash; <span class=\"nobr\">23 марта 2012</span>"
  end

  test "interval helper: 22 марта 2012, 08:00 - 23 марта 2012" do
    @event.since = "2012-03-22T08:00:00+07:00"
    @event.until = "2012-03-23T00:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span>, 08:00 &ndash; <span class=\"nobr\">23 марта 2012</span>"
  end

  test "interval helper: 22 марта 2012 - 22 апреля 2012, 10:00" do
    @event.since = "2012-03-22t00:00:00+07:00"
    @event.until = "2012-04-22T10:00:00+07:00"
    assert_equal interval_for(@event), "<span class=\"nobr\">22 марта 2012</span> &ndash; <span class=\"nobr\">22 апреля 2012</span>, 10:00"
  end

end
