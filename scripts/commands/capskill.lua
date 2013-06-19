function onTrigger(player,skill)
	if(skill=="h2h") then
		player:capSkill(1);
	elseif(skill=="dagger") then
		player:capSkill(2);
	elseif(skill=="sword") then
		player:capSkill(3);
	elseif(skill=="gsword") then
		player:capSkill(4);
	elseif(skill=="axe") then
		player:capSkill(5);
	elseif(skill=="gaxe") then
		player:capSkill(6);
	elseif(skill=="scythe") then
		player:capSkill(7);
	elseif(skill=="polearm") then
		player:capSkill(8);
	elseif(skill=="katana") then
		player:capSkill(9);
	elseif(skill=="gkatana") then
		player:capSkill(10);
	elseif(skill=="club") then
		player:capSkill(11);
	elseif(skill=="staff") then
		player:capSkill(12);
	elseif(skill=="archery") then
		player:capSkill(25);
	elseif(skill=="marksmanship") then
		player:capSkill(26);
	elseif(skill=="throwing") then
		player:capSkill(27);
	elseif(skill=="guard") then
		player:capSkill(28);
	elseif(skill=="evasion") then
		player:capSkill(29);
	elseif(skill=="shield") then
		player:capSkill(30);
	elseif(skill=="parry") then
		player:capSkill(31);
	elseif(skill=="healing") then
		player:capSkill(33);
	elseif(skill=="enhancing") then
		player:capSkill(34);
	elseif(skill=="enfeebling") then
		player:capSkill(35);
	elseif(skill=="elemental") then
		player:capSkill(36);
	elseif(skill=="divine") then
		player:capSkill(32);
	elseif(skill=="dark") then
		player:capSkill(37);
	elseif(skill=="summoning") then
		player:capSkill(38);
	elseif(skill=="ninjitsu") then
		player:capSkill(39);
	elseif(skill=="singing") then
		player:capSkill(40);
	elseif(skill=="string") then
		player:capSkill(41);
	elseif(skill=="wind") then
		player:capSkill(42);
    elseif(skill=="blue") then
		player:capSkill(43);
	else
		--print("Unknown skill type: "..skill);
		player:PrintToPlayer("Unknown skill type: "..skill);
	end
end;