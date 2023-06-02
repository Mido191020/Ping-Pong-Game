import turtle
#intialize screen
wind = turtle.Screen()
wind.title("Ping Pong By Mido Tarek")
wind.bgcolor("black")
wind.setup(width=800,height=600)
wind.tracer(0)
#madrab1
madrab1 =turtle.Turtle()
madrab1.speed(0)
madrab1.shape("square")
madrab1.color("red")
madrab1.shapesize(stretch_wid=5,stretch_len=1)
madrab1.penup()
madrab1.goto(-350,0)
#madrab2
madrab2=turtle.Turtle()
madrab2.speed(0)
madrab2.shape("square")
madrab2.color("blue")
madrab2.shapesize(stretch_wid=5,stretch_len=1)
madrab2.penup()
madrab2.goto(350,0)
#ball
ball=turtle.Turtle()
ball.speed(0)
ball.shape("square")
ball.color("white")
ball.penup()
ball.goto(0,0)
ball.dx=0.1
ball.dy=0.1
#score
score1=0
score2=0
score = turtle.Turtle()
score.speed(0)
score.color("white")
score.penup()
score.hideturtle()
score.goto(0,260)
score.write("Player 1: 0  Player 2: 0", align="center", font=("Arial", 28, "bold"))
#functions
#madrab1
def madrab1_up():
  y=madrab1.ycor()
  y+=20
  madrab1.sety(y)
def madrab1_down():
  y=madrab1.ycor()
  y-=20
  madrab1.sety(y)
#madrab2
def madrab2_up():
  y=madrab2.ycor()
  y+=20
  madrab2.sety(y)
def madrab2_down():
  y=madrab2.ycor()
  y-=20
  madrab2.sety(y)
#keybord bindigs
wind.listen()
wind.onkeypress(madrab1_up,"w") #when pressing w the function madrab1_up is invoked
wind.onkeypress(madrab1_down,"s")
wind.onkeypress(madrab2_up,"Up")
wind.onkeypress(madrab2_down,"Down")
#main game loop
while True:
  wind.update()#update the screen everytime
  #move the ball
  ball.setx(ball.xcor()+ball.dx)#ball start at 0 and everytime loops run--->+0.05 xaxix
  ball.sety(ball.ycor()+ball.dy)#ball start at 0 and everytime loops run--->+0.05 yaxix
  #border check,top broder +300 px ,bottom -300px, ball is 20 px
  if ball.ycor()>290:#if ball is at top broder
    ball.sety(290)#set y coordinate +290
    ball.dy*=-1 #reverse direction , making +0.05 -->-0.05
  if ball.ycor()<-290:#if ball is at  bottom broder
    ball.sety(-290)
    ball.dy*=-1
  if ball.xcor()>390:#if ball is at  right broder
    ball.goto(0,0)
    ball.dx *=-1
    score1 +=1
    score.clear()
    score.write("Player 1: {} player 2:  {}".format(score1,score2),align="center",font=("Arial", 28, "bold"))
  if ball.xcor()<-390:#if ball is at  left broder
    ball.goto(0,0)
    ball.dx *=-1
    score2 +=1
    score.clear()
    score.write("Player 1: 0 player 2: 0",align="center",font=("Arial", 28, "bold"))
   # Hit madrab and ball
  #if (ball.xcor() > 340 and ball.xcor() < 350) and (ball.ycor() < madrab2.ycor() + 50 and ball.ycor() > madrab2.ycor() - 50):
    #ball.setx(340)
    #ball.dx *= -1
    # Hit madrab and ball
  if (ball.xcor() > 340 and ball.xcor() < 350) and (ball.ycor() < madrab2.ycor() + 50 and ball.ycor() > madrab2.ycor() - 50):
    ball.setx(340)
    ball.dx *= -1

  if (ball.xcor() < -340 and ball.xcor() > -350) and (ball.ycor() < madrab1.ycor() + 50 and ball.ycor() > madrab1.ycor() - 50):
    ball.setx(-340)
    ball.dx *= -1
