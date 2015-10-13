-----------------------------------
-- Area: Yuhtunga Jungle
-- NPC:  Tipha
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	if (GetServerVariable("[ZM4]Fire_Headstone_Active") == 0) then
		SetServerVariable("[ZM4]Fire_Headstone_Active",1);
	elseif (GetServerVariable("[ZM4]Fire_Headstone_Active") == 1) then
		SetServerVariable("[ZM4]Fire_Headstone_Active",os.time()+ 900);
	end

end;