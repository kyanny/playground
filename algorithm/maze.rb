#!/usr/bin/env ruby

class Maze
  def initialize(data)
    @maze = []

    data.split("\n").each_with_index do |line, x|
      linemaze = []

      line.split(//).each_with_index do |c, y|
        if c == 'S'
          @start = [x, y]
        end
        if c == 'G'
          @goal = [x, y]
        end

        if c == ' '
          linemaze << [x, y]
        else
          linemaze << c
        end
      end

      @maze << linemaze
    end
  end

  def to_s
    str = ""

    @maze.each do |linemaze|
      linemaze.each do |c|
        if c.is_a?(Array)
          str << " "
        else
          str << c
        end
      end
      str << "\n"
    end

    str
  end
end

data = DATA.read
maze = Maze.new(data)
puts maze

#p maze.to_s == data


__END__
**************************
*S* *                    *
* * *  *  *************  *
* *   *    ************  *
*    *                   *
************** ***********
*                        *
** ***********************
*      *              G  *
*  *      *********** *  *
*    *        ******* *  *
*       *                *
**************************
