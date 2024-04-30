function main(runTime)
	i = 1
	for i = 1, runTime
	do
		print("Restarting loop...")
		print("Progress: " .. tostring(i))
		if i % 4 == 0 or i == 1 then
			print("Placing torch...")
			placeTorch(1)
		end
		print("Digging 3x3 hole...")
		cPlace(2)
		turtle.dig()
		turtle.turnRight()
		cPlace(0)
		turtle.up()
		cPlace(0)
		turtle.turnLeft()
		turtle.dig()
		turtle.up()
		turtle.turnRight()
		cPlace(0)
		turtle.turnLeft()
		cPlace(1)
		turtle.dig()
		turtle.turnLeft()
		
		turtle.forward()
		cPlace(1)
		turtle.turnRight()
		turtle.dig()
		turtle.down()
		turtle.dig()
		turtle.down()
		turtle.dig()
		cPlace(2)
		turtle.turnLeft()
		
		turtle.forward()
		cPlace(2)
		cPlace(0)
		turtle.turnRight()
		turtle.dig()
		turtle.up()
		turtle.dig()
		turtle.turnLeft()
		cPlace(0)
		turtle.up()
		cPlace(0)
		turtle.turnRight()
		cPlace(1)
		turtle.dig()
		
		turtle.turnRight()
		turtle.forward()
		turtle.forward()
		turtle.turnLeft()
		turtle.down()
		turtle.down()
		turtle.forward()
	end
	print("Done!")
end

-- this function is to make sure the slot we have selected
-- contains a solid block we can use to build with
-- -- direction = 0 for forward, 1 for up, 2 for down
function cPlace(direction)
	local currentSlot = turtle.getSelectedSlot()
	if currentSlot == torchPosition then turtle.select(currentSlot+1) return end
	if turtle.getItemCount(currentSlot) > 0 then
		if direction == 0 then
			turtle.place()
		elseif direction == 1 then
			turtle.placeUp()
		elseif direction == 2 then
			turtle.placeDown()
		end
		return
	end
	if currentSlot > 0 and currentSlot < 16
	then
		currentSlot = currentSlot + 1
	elseif currentSlot == 16
	then
		currentSlot = 1
	end
	turtle.select(currentSlot)
	cPlace(direction)
end

-- this function places a torch behind the starting point
function placeTorch(i)
	local currentSlotIndex = i
	turtle.select(currentSlotIndex)
    local itemDetail = turtle.getItemDetail(currentSlotIndex)
    if itemDetail and itemDetail.name == "minecraft:torch" 
	then
		torchPosition = currentSlotIndex
		turtle.turnRight()
		turtle.turnRight()
		turtle.place()
		turtle.turnRight()
		turtle.turnRight()
	else
		currentSlotIndex = currentSlotIndex + 1
		turtle.select(currentSlotIndex)
		placeTorch(currentSlotIndex)
	end
end

print("How long should this tunnel be? Type a number and press enter.")
torchPosition = 0
main(tonumber(read()))