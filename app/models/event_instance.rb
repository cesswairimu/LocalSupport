class EventInstance < Event

  def schedule
    schedule = IceCube::Schedule.new(now= start_date)
    case occur
    when 'daily'
      schedule.add_recurrence_rule IceCube::Rule.daily(1)
    when 'weekly'
      schedule.add_recurrence_rule IceCube::Rule.weekly(1)
    when 'biweekly'
      schedule.add_recurrence_rule IceCube::Rule.weekly(2)
    when 'monthly'
      schedule.add_recurrence_rule IceCube::Rule.monthly(1)
    end
    schedule
  end

  def recurring_events
    schedule.occurrences_between(Time.zone.now, 14.days.from_now).map do |date|
      EventInstance.new(id: id, title: title, description: description,
                        organisation_id: organisation_id, address: address,
                        start_date: date, end_date: date+ (end_date - start_date))
    end
  end
end
