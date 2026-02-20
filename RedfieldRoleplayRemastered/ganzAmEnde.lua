setTimer(function()
	for _,v in pairs(getElementsByType("vehicle"))do
		setElementFrozen(v,true)
	end
end,2000,1)