bg_fill = (0, 0, 0, 50)

def setup():
    size(600, 600)
    colorMode(HSB)


def noise():
    noStroke();
    for i in range(0, width-1, int(width/5) ):
        for j in range(0, height-1, int(height/5) ):
            fill(random(0, 150), random(0, 20))
            rect(random(i - 5, i), random(j - 5, j), 1, 1)
            
    for i in range(10):
        fill(random(0, 255), random(0, 200))
        rect(random(0, width), random(0, height), random(1, 3), random(1, 3))
    
 
def draw():
    # Update Background
    noStroke()
    fill(*bg_fill)
    rect(0, 0, width, height)
    
    # Dot at Mouse Location
    fill(frameCount % 255, 255, 255)
    ellipse(mouseX, mouseY, 20, 20)
    
    # Draw Triangles
    # noFill()
    # stroke(255,255,255)
    
    # if (frameCount-1)%10 == 0:
    #     x1, y1 = 0, height
    #     x2, y2 = width/2, 0
    #     x3, y3 = width, height
    # else:
    #     x1, y1 = (x1+x2)/2, (y1+y2)/2
    #     x2, y2 = (x2+x3)/2, (y2+y3)/2
    #     x3, y3 = (x3+x1)/2, (y3+y1)/2
        
    # triangle(x1, y1, x2, y2, x3, y3)
    
    # Add Noise Layer
    noise()
    print(bg_fill)
    
