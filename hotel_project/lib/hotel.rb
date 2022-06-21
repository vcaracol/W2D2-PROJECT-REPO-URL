require_relative "room"

class Hotel
    def initialize(name, hash)
        @name = name
        @rooms = Hash.new {|h, key| h[key] = 0}
        hash.each do |k, v|
            @rooms[k] = Room.new(hash[k])
        end
    end

    def name
        cap = @name.split.map do |word|
            word.capitalize
        end
        cap.join(" ")
    end

    def rooms
        @rooms
    end

    def room_exists?(string)
        if @rooms.has_key?(string)
            return true
        else
            return false
        end
    end

    def check_in(person, room_name)
        if room_exists? (room_name)                                                                                    
            if @rooms[room_name].add_occupant(person)
                print "check in successful"
            else
                print "sorry, room is full"
            end
        else
            print "sorry, room does not exist"
        end
    end

    def has_vacancy?
        @rooms.each do |k, v|
            if  v.full? == true
                return false
            else
                return true
            end
        end
    end

    def list_rooms
        @rooms.each do |k, v|
            print "#{k} + #{@rooms[k].available.space}"
        end
    end
end
