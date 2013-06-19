-----------------------------------
--	[Command name]: changejob
--	[Author      ]: 
--	[Description ]: Changes job to the specified job and level
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,jobname,lvl)
	--parse the jobname
	if(jobname=="WAR" or jobname=="war" or jobname=='1') then
		player:changeJob(1);
	elseif(jobname=="MNK" or jobname=="mnk" or jobname=='2') then
		player:changeJob(2);
	elseif(jobname=="WHM" or jobname=="whm" or jobname=='3') then
		player:changeJob(3);
	elseif(jobname=="BLM" or jobname=="blm" or jobname=='4') then
		player:changeJob(4);
	elseif(jobname=="RDM" or jobname=="rdm" or jobname=='5') then
		player:changeJob(5);
	elseif(jobname=="THF" or jobname=="thf" or jobname=='6') then
		player:changeJob(6);
	elseif(jobname=="PLD" or jobname=="pld" or jobname=='7') then
		player:changeJob(7);
	elseif(jobname=="DRK" or jobname=="drk" or jobname=='8') then
		player:changeJob(8);
	elseif(jobname=="BST" or jobname=="bst" or jobname=='9') then
		player:changeJob(9);
	elseif(jobname=="BRD" or jobname=="brd" or jobname=='10') then
		player:changeJob(10);
	elseif(jobname=="RNG" or jobname=="rng" or jobname=='11') then
		player:changeJob(11);
	elseif(jobname=="SAM" or jobname=="sam" or jobname=='12') then
		player:changeJob(12);
	elseif(jobname=="NIN" or jobname=="nin" or jobname=='13') then
		player:changeJob(13);
	elseif(jobname=="DRG" or jobname=="drg" or jobname=='14') then
		player:changeJob(14);
	elseif(jobname=="SMN" or jobname=="smn" or jobname=='15') then
		player:changeJob(15);
	elseif(jobname=="BLU" or jobname=="blu" or jobname=='16') then
		player:changeJob(16);
	elseif(jobname=="COR" or jobname=="cor" or jobname=='17') then
		player:changeJob(17);
	elseif(jobname=="PUP" or jobname=="pup" or jobname=='18') then
		player:changeJob(18);
	elseif(jobname=="DNC" or jobname=="dnc" or jobname=='19') then
		player:changeJob(19);
	elseif(jobname=="SCH" or jobname=="sch" or jobname=='20') then
		player:changeJob(20);
	elseif(jobname=="GEO" or jobname=="geo" or jobname=='21') then
		player:changeJob(21);
	elseif(jobname=="RUN" or jobname=="run" or jobname=='22') then
		player:changeJob(22);
	else
		--print('Unrecognised job (1st param) entered. Use the ID number or short name e.g. WAR'); 
		player:PrintToPlayer('Unrecognised job (1st param) entered. Use the ID number or short name e.g. WAR');
	end
	if(lvl>0 and lvl<=99) then
		player:setLevel(lvl);
	else
		--print('Level (2nd param) must be between 1~99');
		player:PrintToPlayer('Level (2nd param) must be between 1~99');
	end
end;