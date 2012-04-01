

function OnUseAbility(user, target, ability)


	print(user)
	--target:updateEnmity(user, user:getMainLvl()*3);
target:updateEnmity(user,2800,1);

end;