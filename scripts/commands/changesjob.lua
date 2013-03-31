-----------------------------------
--	[Command name]: changesJob
--	[Author      ]: 
--	[Description ]: Changes sub job to the specified job and level
-----------------------------------

-----------------------------------
-- Action
-----------------------------------

function onTrigger(player,jobname,lvl)
	--parse the jobname
	if(jobname=="WAR" or jobname=="war" or jobname=='1') then
		player:changesJob(1);
	elseif(jobname=="MNK" or jobname=="mnk" or jobname=='2') then
		player:changesJob(2);
	elseif(jobname=="WHM" or jobname=="whm" or jobname=='3') then
		player:changesJob(3);
	elseif(jobname=="BLM" or jobname=="blm" or jobname=='4') then
		player:changesJob(4);
	elseif(jobname=="RDM" or jobname=="rdm" or jobname=='5') then
		player:changesJob(5);
	elseif(jobname=="THF" or jobname=="thf" or jobname=='6') then
		player:changesJob(6);
	elseif(jobname=="PLD" or jobname=="pld" or jobname=='7') then
		player:changesJob(7);
	elseif(jobname=="DRK" or jobname=="drk" or jobname=='8') then
		player:changesJob(8);
	elseif(jobname=="BST" or jobname=="bst" or jobname=='9') then
		player:changesJob(9);
	elseif(jobname=="BRD" or jobname=="brd" or jobname=='10') then
		player:changesJob(10);
	elseif(jobname=="RNG" or jobname=="rng" or jobname=='11') then
		player:changesJob(11);
	elseif(jobname=="SAM" or jobname=="sam" or jobname=='12') then
		player:changesJob(12);
	elseif(jobname=="NIN" or jobname=="nin" or jobname=='13') then
		player:changesJob(13);
	elseif(jobname=="DRG" or jobname=="drg" or jobname=='14') then
		player:changesJob(14);
	elseif(jobname=="SMN" or jobname=="smn" or jobname=='15') then
		player:changesJob(15);
	elseif(jobname=="BLU" or jobname=="blu" or jobname=='16') then
		player:changesJob(16);
	elseif(jobname=="COR" or jobname=="cor" or jobname=='17') then
		player:changesJob(17);
	elseif(jobname=="PUP" or jobname=="pup" or jobname=='18') then
		player:changesJob(18);
	elseif(jobname=="DNC" or jobname=="dnc" or jobname=='19') then
		player:changesJob(19);
	elseif(jobname=="SCH" or jobname=="sch" or jobname=='20') then
		player:changesJob(20);
	elseif(jobname=="GEO" or jobname=="geo" or jobname=='21') then
		player:changesJob(21);
	elseif(jobname=="RUN" or jobname=="run" or jobname=='22') then
		player:changesJob(22);
	else
		print('Unrecognised job (1st param) entered. Use the ID number or short name e.g. WAR'); 
	end
	if(lvl>0 and lvl<=99) then
		player:setsLevel(lvl);
	else
		print('Level (2nd param) must be between 1~99'); 
	end
end;
