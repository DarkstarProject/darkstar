-----------------------------------
-- Area: The Ashu Talif
-- NPC: Windjammer Imp
-----------------------------------

require("scripts/globals/status");
    
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
  mob:entityAnimationPacket("prov")
  mob:entityAnimationPacket("yfu3")
   mob:entityAnimationPacket("JNJ1")
 
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
  mob:entityAnimationPacket("prov")
  mob:entityAnimationPacket("yfu3")
   mob:entityAnimationPacket("JNJ1")
   mob:entityAnimationPacket("soul")
   mob:entityAnimationPacket("lg15")
   mob:entityAnimationPacket("goa1")
   mob:entityAnimationPacket("fg12")
   mob:entityAnimationPacket("rmaf")
end;


function onMobRoam(mob)
  mob:entityAnimationPacket("prov")
  mob:entityAnimationPacket("yfu3")
   mob:entityAnimationPacket("JNJ1")
   mob:entityAnimationPacket("soul")
   mob:entityAnimationPacket("lg15")
   mob:entityAnimationPacket("goa1")
   mob:entityAnimationPacket("fg12")
   mob:entityAnimationPacket("rmaf")

end;


-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
    target:entityVisualPacket("rmra");
    target:entityVisualPacket("rmaf");
    target:entityVisualPacket("rp14");
    target:entityVisualPacket("yfu3");
	    target:entityVisualPacket("JNJ1");
    target:entityVisualPacket("soul");
    target:entityVisualPacket("goa1");
    target:entityVisualPacket("lg15");
	    target:entityVisualPacket("fg12");
			    target:entityVisualPacket("hit1");
					    target:entityVisualPacket("fnramp");
							    target:entityVisualPacket("soulgt");
								    target:entityVisualPacket("goa2");
									    target:entityVisualPacket("goa3");

mob:entityAnimationPacket("rmra")
mob:entityAnimationPacket("rmaf")
  mob:entityAnimationPacket("rp14")
  mob:entityAnimationPacket("yfu3")
   mob:entityAnimationPacket("JNJ1")
   mob:entityAnimationPacket("soul")
   mob:entityAnimationPacket("lg15")
   mob:entityAnimationPacket("goa1")
   mob:entityAnimationPacket("fg12")
   mob:entityAnimationPacket("rmaf")
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(mob)   
 
  
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
