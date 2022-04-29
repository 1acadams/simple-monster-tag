require 'ruby2d'

# Set window title and size
set title: "Monster Tag"
set width: 1000
set height: 600
set background: 'yellow'

# Set variables for keeping score
stop = false

# Load and position game images
txt = Text.new(
  "Don't get smashed by the hammer! ",
  x: 655, y: 10,
  style: 'bold',
  size: 20,
  color: 'white',
)


ruby = Image.new('/Users/allisonadams/Desktop/CSC151/ruby.png')
hammer = Image.new(
  '/Users/allisonadams/Desktop/CSC151/hammer.png',
  x: 655, y:10
)

# ruby follows mouse
on :mouse_move do |event|
  ruby.x = event.x - 50
  ruby.y = event.y - 50

  if ruby.contains? (hammer.x), (hammer.y)
    puts "hit"
    stop = true
    txt.text = "Game over :,("
  end
end


# make hammer follow ruby
update do

  if !stop
    if ruby.x > hammer.x
      hammer.x += 3
    else
      hammer.x -= 3
    end

    if ruby.y > hammer.y
      hammer.y += 3
    else
      hammer.y -= 3
    end
  end

end

show