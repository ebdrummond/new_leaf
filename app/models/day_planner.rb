require 'time'
require 'pry'

class DayPlanner
  attr_reader :appointments

  def initialize(appointments)
    @appointments = appointments#.sort_by{|appt| appt.start_time}
  end

  def time_slots
    slots = []
    appointments.each do |appt|
      slots << TimeSlot.new(starts: appt.start_time, duration: appt.duration)
    end
    slots << morning_slot
    slots.concat(in_between_slots)
    slots << afternoon_slot
    slots
  end





  # def initialize(appointment)
  #   @appointment = appointment
  #   @day_start = Time.new(2013, 1, 1, 9)
  #   @day_end = Time.new(2013, 1, 1, 16)
  # end

  # def time_slots
  #   slots = []
  #   slots << "#{day_start.strftime("%H:%M")} to #{appointment.start_time.strftime("%H:%M")}"
  #   slots << "#{appointment.start_time.strftime("%H:%M")} to #{(appointment.start_time + (appointment.duration * 60)).strftime("%H:%M")}"
  #   slots << "#{(appointment.start_time + (appointment.duration * 60)).strftime("%H:%M")} to #{day_end.strftime("%H:%M")}"
  # end

  # def start_time(time_slot)
  #   time_slot.split(" to ").first
  # end

  # def end_time(time_slot)
  #   time_slot.split(" to ").last
  # end

  # def duration(time_slot)
  #   (Time.parse(end_time(time_slot)) - Time.parse(start_time(time_slot)))/60
  # end

  # def open_slots
  #   time_slots.select{|ts| !appointment.start_time.to_s.include?(start_time(ts))  && duration(ts) >= 60}
  # end
end

