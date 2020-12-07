class Simulator

  def initialize(ampare, kilowatt_hour)
    @ampare = ampare
    @kilowatt_hour = kilowatt_hour
    @array=[]
  end

  
  def calc_tepco
    # 基本料金
    tepco= { "10A" => "286", "15A" => "429", "20A" => "572","30A" => "858", "40A" => "1144", "50A" => "1430", "60A" => "1716" }
    tokyo_gas= { "30A" => "858", "40A" => "1144", "50A" => "1430", "60A" => "1716" }
    # kWhの条件と計算結果
    if @kilowatt_hour < 120
      sum_tepco = tepco["#{@ampare}A"].to_i + 19.88*@kilowatt_hour
    elsif @kilowatt_hour >=120 && @kilowatt_hour < 300
      sum_tepco = tepco["#{@ampare}A"].to_i + 26.48*@kilowatt_hour
    else
      sum_tepco = tepco["#{@ampare}A"].to_i + 30.57*@kilowatt_hour
    end  
    @sum_tepco= sum_tepco
    # p @sum_tepco
    @array << @sum_tepco
    # p @array
  end
  
  def calc_loooop
    # 計算結果
    sum_loooop = 26.4*@kilowatt_hour
    @sum_loooop= sum_loooop
    # p @sum_loooop
    @array << @sum_loooop
    # p @array

  end
  
  def calc_tokyo_gas
    # 基本料金
    tepco= { "10A" => "286", "15A" => "429", "20A" => "572","30A" => "858", "40A" => "1144", "50A" => "1430", "60A" => "1716" }
    tokyo_gas= { "30A" => "858", "40A" => "1144", "50A" => "1430", "60A" => "1716" }
    # kWhの条件と計算結果
    if @kilowatt_hour < 140
      sum_tokyo_gas = tokyo_gas["#{@ampare}A"].to_i + 23.67*@kilowatt_hour
    elsif @kilowatt_hour >=140 && @kilowatt_hour < 350
      sum_tokyo_gas = tokyo_gas["#{@ampare}A"].to_i + 23.88*@kilowatt_hour
    else
      sum_tokyo_gas = tokyo_gas["#{@ampare}A"].to_i + 26.41*@kilowatt_hour
    end  
    @sum_tokyo_gas= sum_tokyo_gas
    # p @sum_tokyo_gas
    @array << @sum_tokyo_gas
    # p @array
  end

  def simulate
    lowest = @array.min
    p lowest
  end
end

# 入力欄
p "契約アンペアを入力してください(A)"
ampere = gets.to_i
p "1ヶ月の電力使用料を入力してください(kWh)"
kilowatt_hour = gets.to_i
simulator = Simulator.new(ampere,kilowatt_hour)
simulator.calc_tepco
simulator.calc_loooop
simulator.calc_tokyo_gas
simulator.simulate



