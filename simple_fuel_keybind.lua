rs = game:GetService("ReplicatedStorage");


game:GetService("UserInputService").InputBegan:Connect(function(key, gp)
	if key.UserInputType == Enum.UserInputType.Keyboard then
		if key.KeyCode == Enum.KeyCode.K then
			rs.Remote.Refuel:FireServer(1, os.time());
		end
	end
end)

-- name says it all
-- refuels your car on 'k' being pressed
-- still costs money
