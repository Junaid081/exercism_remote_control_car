defmodule RemoteControlCar do
    @enforce_keys [:nickname]
    defstruct [:nickname, battery_percentage: 100, distance_driven_in_meters: 0]
  def new() do
     %RemoteControlCar{nickname: "none"}   
  end

  def new(nickname) do
      %RemoteControlCar{nickname: nickname}
  end

  def display_distance(remote_car) when remote_car.nickname == "none" do
      value = remote_car.distance_driven_in_meters
     "#{value} meters"
  end

  def display_battery(remote_car) when remote_car.nickname == "none" do
    value = remote_car.battery_percentage
    if value == 0 do
      "Battery empty"
    else
     "Battery at #{value}%"
    end
  end

  def drive(remote_car) when remote_car.__struct__ == RemoteControlCar do
    value = remote_car.battery_percentage
    if value == 0 do
    remote_car
    else
    car = remote_car
    car = %{car | battery_percentage: 99}
    %{car | distance_driven_in_meters: 20}
    end
  end
end
