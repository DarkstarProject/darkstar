

-----------------------------------------------------------------
-- Variable for getNationTeleport and getPoint
-----------------------------------------------------------------

ALLIED_NOTES = 11;
MAW = 4;
PAST_SANDORIA = 5;
PAST_BASTOK = 6;
PAST_WINDURST = 7;

-----------------------------------
-- hasMawActivated Action
-----------------------------------

-- 1st number for hasMawActivated()
-- 2nd number for player:addNationTeleport();

-- 0	1	Batallia Downs (S) (H-5) 
-- 1	2	Rolanberry Fields (S) (H-6) 
-- 2	4	Sauromugue Champaign (S) (K-9) 
-- 3	8	Jugner Forest (S) (H-11) 
-- 4	16	Pashhow Marshlands (S) (K-8) 
-- 5	32	Meriphataud Mountains (S) (K-6) 
-- 6	64	East Ronfaure (S) (H-5) 
-- 7	128	North Gustaberg (S) (K-7) 
-- 8	256	West Sarutabaruta (S) (H-9) 

function hasMawActivated(player,portal)
	
	local mawActivated = player:getNationTeleport(MAW);
	local bit = {};
	
	for i = 8,0,-1 do
		twop = 2^i
		
		if(mawActivated >= twop) then
			bit[i]=true; mawActivated = mawActivated - twop;
		else
			bit[i]=false;
		end
	end;
	
	return bit[portal];
	
end;

-- TODO:
-- Past nation teleport