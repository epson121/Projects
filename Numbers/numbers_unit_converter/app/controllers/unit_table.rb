TABLE = {     1 =>  {
                #Celsius to ->
                1 => { 
                  #Celsius
                  1 => "",
                  #Fahrenheit 
                  2 => ".to_f * 9/5 + 32.to_f"
                }, 
                #Fahrenheit to ->
                2 => { 
                  #Celsius
                  1 => "-32) * 5/9.to_f", 
                  #Fahrenheit
                  2 => ""
                } 
              },
              #Mass
              2 => {
                      #Kilogram to ->
                      1 => {
                        #Kilogram
                        1 => "1",
                        #Gram
                        2 => "1000",
                        #Miligram
                        3 => "1000000",
                        #Ton
                        4 => "0.001", 
                        #Pound
                        5 => "2.2046"
                      },
                      #Gram to ->
                      2 => {
                        #Kilogram
                        1 => "0.001",
                        #Gram
                        2 => "1",
                        #Miligram
                        3 => "1000",
                        #Ton
                        4 => "0.000001",
                        #Pound
                        5 => "0.0022046"
                      },
                      #Miligram to ->
                      3 => {
                        #Kilogram
                        1 => "0.000001",
                        #Gram
                        2 => "0.001",
                        #Miligram
                        3 => "1",
                        #Ton
                        4 => "0.000000001",
                        #Pound
                        5 => "0.0000022046"
                      },
                      #Ton to ->
                      4 => {
                        #Kilogram
                        1 => "1000",
                        #Gram
                        2 => "1000000",
                        #Miligram
                        3 => "1000000000",
                        #Ton
                        4 => "1",
                        #Pound
                        5 => "2204.6"
                      },
                      #Pound to ->
                      5 => {
                        #Kilogram
                        1 => "0.4535",
                        #Gram
                        2 => "453.597",
                        #Miligram
                        3 => "453597.024",
                        #Ton
                        4 => "0.0004535",
                        #Pound
                        5 => "1"
                      }
                  },
                #Speed
                3 => {
                  #KMh to ->
                  1 => {
                    #Kmh
                    1 => "1",
                    #mph
                    2 => "0.621371"
                  },
                  #Mph to
                  2 => {
                    #Kmh
                    1 => "1.60934",
                    #Mph
                    2 => "1"
                  }
                },
                4 => {
                  #Kilometer to ->
                  1 => {
                    #Kilometer
                    1 => "1",
                    #Meter
                    2 => "1000",
                    #Centimeter
                    3 => "100000",
                    #Milimiter
                    4 => "1000000",
                    #Mile
                    5 => "0.621371",
                  },
                  #Meter to ->
                  2 => {
                    #Km
                    1 => "0.001",
                    #Meter
                    2 => "1",
                    #Centimeter
                    3 => "100",
                    #Milimeter
                    4 => "1000",
                    #Mile
                    5 => "0.000621371",
                  },
                  #Centimeter to ->
                  3 => {
                    #Kmh
                    1 => "0.00001",
                    #Meter
                    2 => "0.01",
                    #Centimeter
                    3 => "1",
                    #Milimeter
                    4 => "10",
                    #Mile
                    5 => "0.00000621371",
                  },
                  #Milimeter to ->
                  4 => {
                    #Kmh
                    1 => "0.000001",
                    #Meter
                    2 => "0.001",
                    #Centimeter
                    3 => "0.1",
                    #Milimeter
                    4 => "1",
                    #Mile
                    5 => "0.000000621371",
                  },
                  #Mile to ->
                  5 => {
                    #Kmh
                    1 => "1.60934",
                    #Meter
                    2 => "1609.34",
                    #Centimeter
                    3 => "160934",
                    #Milimeter
                    4 => "160934000",
                    #Mile
                    5 => "1",
                  },
                },
                #Volume
                5 => {
                  #Cubic meter to ->
                  1 => {
                    #Cubic meter
                    1 => "1",
                    #Galon
                    2 => "264.172",
                    #Liter
                    3 => "1000"
                  },
                  #Galon
                  2 => {
                    #Cubic meter
                    1 => "0.00378541",
                    #Galon
                    2 => "1",
                    #Liter
                    3 => "3.78541"
                  },
                  #Liter
                  3 => {
                    #Cubic meter
                    1 => "0.001",
                    #Galon
                    2 => "0.264172",
                    #Liter
                    3 => "1"
                  }
                },
                #Area
                6 => {
                  #Square km
                  1 => {
                    #Square km
                    1 => "1",
                    #Square m
                    2 => "100000",
                    #Hectare
                    3 => "100",
                    #Square mile
                    4 => "0.386102",
                  },
                  #Square m
                  2 => {
                    #Square km
                    1 => "0.000001",
                    #Square m
                    2 => "1",
                    #Hectare
                    3 => "0.0001",
                    #Square mile
                    4 => "0.000003861",
                  },
                  #Hectare
                  3 => {
                    #Square km
                    1 => "0.01",
                    #Square m
                    2 => "10000",
                    #Hectare
                    3 => "1",
                    #Square mile
                    4 => "0.00386102",
                  },
                  #Square mile
                  4 => {
                    #Square km
                    1 => "2.58999",
                    #Square m
                    2 => "258999.9",
                    #Hectare
                    3 => "258.999",
                    #Square mile
                    4 => "1",
                  }
                }
              }
              #[["Square km", 1], ["Square m", 2], ["Hectare", 3], ["Square mils", 4]]