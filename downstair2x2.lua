function main()
	turtle.digDown()
	turtle.down()
	turtle.dig()
	
	while (true)
	do
		turtle.forward()
		turtle.turnLeft()
		turtle.dig()
		turtle.digDown()
		turtle.down()
		turtle.dig()
	end
end

main()