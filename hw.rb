class SubWay 
    @Red = ["South Station","Park Street","Kendall","Central","Harvard","Porter","Davis","Alewife"]
    @Green = ["Government Center","Park Street","Boylston","Arlington","Copley","Hynes","Kenmore"]
    @Orange = ['North Station','Haymarket','Park Street','State','Downtown Crossing','Chinatown''Back Bay','Forest Hills' ] 
def self.stops_between_stations (lineA, startStop,lineB, endStop)
    if lineA == "Red" 
        tmpArray1 = @Red 
    elsif lineA == "Green" 
        tmpArray1 = @Green
    elsif lineA == "Orange" 
        tmpArray1 = @Orange
    else 
        tmpArray1 = "wrong line"
    end
    if lineB == "Red" 
        tmpArray2 = @Red 
    elsif lineB == "Green" 
        tmpArray2 = @Green
    elsif lineB == "Orange" 
        tmpArray2 = @Orange
    else 
        tmpArray2 = "wrong line"
    end
    stops(tmpArray1, startStop,tmpArray2, endStop ,lineA,lineB)
end
def self.stops(tmpArray1, startStop,tmpArray2, endStop,lineA,lineB)
    startarr = []
    startarrnames = []
    endarrnames = []
    if tmpArray1 == "wrong line"
        puts "wrong first line"
    elsif tmpArray2 == "wrong line"
        puts "wrong second line"
    else
        if tmpArray1.include?(startStop)
            if tmpArray1.include?(endStop)
                if tmpArray1.index(startStop) == tmpArray1.index(endStop)
                    startarrnames.push(tmpArray1[tmpArray1.index(startStop)])
                elsif tmpArray1.index(startStop) > tmpArray1.index(endStop)
                    startarr = (tmpArray1.index(endStop).to_i .. tmpArray1.index(startStop).to_i).to_a.reverse()
                    startarrnames= loppfun(startarr,startarrnames,tmpArray1)
                else
                    startarr = (tmpArray1.index(startStop).to_i .. tmpArray1.index(endStop).to_i).to_a
                    startarrnames= loppfun(startarr,startarrnames,tmpArray1)
                end
            elsif tmpArray2.include?(endStop)
                if tmpArray1.index(startStop) > tmpArray1.index("Park Street")
                    startarr = (tmpArray1.index("Park Street").to_i .. tmpArray1.index(startStop).to_i).to_a.reverse()
                    startarrnames= loppfun(startarr,startarrnames,tmpArray1)
                    startarrnames.reverse()
                else
                    startarr = (tmpArray1.index(startStop).to_i .. tmpArray1.index("Park Street").to_i).to_a
                    startarrnames= loppfun(startarr,startarrnames,tmpArray1)
                end
                if tmpArray2.index(endStop) > tmpArray2.index("Park Street")
                    startarr = (tmpArray2.index("Park Street").to_i .. tmpArray2.index(endStop).to_i).to_a
                    endarrnames= loppfun(startarr,endarrnames,tmpArray2)
                    endarrnames.slice!(endarrnames.index("Park Street"),1)
                else
                    startarr = (tmpArray2.index(endStop).to_i .. tmpArray2.index("Park Street").to_i).to_a
                        endarrnames= loppfun(startarr,endarrnames,tmpArray2)
                    endarrnames.slice!(endarrnames.index("Park Street"),1)
                end
            else
                puts "wrong second stop"
            end
        else 
            puts "wrong first stop"
        end
        printfunc(endarrnames,startarrnames,lineA,lineB)
    end
end

def self.printfunc(endarrnames, startarrnames, lineA,lineB)
    if endarrnames == [] && startarrnames == []
       puts "Please check what you entred"
    elsif endarrnames == []
        if startarrnames.length == 1
            puts "****************"
            puts "You don't need to travel !!"
            puts "You are in the stop #{startarrnames[0]}"
            puts "#{startarrnames.count()-1} stops in total."
            puts "****************"
        else
            puts "****************"
            startarrnames[startarrnames.length-1] = "and #{startarrnames[startarrnames.length-1]}" 
            puts "You must travel through the following stops on the #{lineA} line:"
            puts startarrnames.join(" --> ")
            puts "#{startarrnames.count()-1} stops in total."
            puts "****************"
        end
    else
        puts "****************"
        startarrnames[startarrnames.length-1] = "and #{startarrnames[startarrnames.length-1]}"
        endarrnames[endarrnames.length-1] = "and #{endarrnames[endarrnames.length-1]}" 
        puts "You must travel through the following stops on the #{lineA} line:"
        puts startarrnames.join(" --> ")
        puts "Change at Park Street."
        puts "Your trip continues through the following stops on #{lineB} Line:" 
        puts endarrnames.join(" --> ")
        puts "#{startarrnames.count()-1 + endarrnames.count()} stops in total."
        puts "****************"
    end
end
def self.loppfun(startarr,endarrnames,tmpArray2) 
    startarr.length.times do |i|
        endarrnames.push(tmpArray2[startarr[i]])
    end
    endarrnames
end
end
puts SubWay.stops_between_stations('Red', 'Alewife', 'Red', 'Alewife') # 0
puts SubWay.stops_between_stations('Red', 'Alewife', 'Red', 'South Station') # 7
puts SubWay.stops_between_stations('Red', 'South Station', 'Green', 'Kenmore') # 6 