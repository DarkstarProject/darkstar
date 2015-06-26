---------------------------------------------------
-- Healing Breath III
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, master)
   -- Healing Breath III formula:
   -- floor(0.1757*(Drachen Brais Bonus + "Wyvern Exp Bonus" + 1) * (Helm Bonus + Wyvern TP Bonus + Deep Breathing Bonus + 1)*(Wyvern HP + Wyvern HP+ Gear) + 42)

   -- http://images2.wikia.nocookie.net/__cb20080714061150/ffxi/images/3/32/Healingbreathgraph.jpg

   -- TODO:
   -- Wyvern stats are wrong.  Should be main job DRG, complete with traits.  Current method uses subjob to track wyvern type.  Healing wyvern ends up with 901 HP @ 75 instead of 991.
      -- 991 HP is pre-2010 DRG buff
      -- Wyvern gets row/grade "5" for race in CalculateStats()
   -- Healing Breath I and II should have lower multipliers.  They'll need to be corrected if the multipliers are ever found.  Don't want to over-correct right now.
   -- Drachen Brais provide a 10% increase to HP.  0.1 on that slot provides the correct increase, or 0.15 for HQs.
      -- Per Source 2 below, +HP% gear is applied to Base + non% HP gear.  (991+50)*1.10  If you do that, the formula seems to output the same either way.
   -- Wyvern Exp Bonus is +6% HP per 200 exp gained until 1,000 exp cap, granting a max 30% (0.3 works in the formula)
      -- This might be handled the same way Drachen Brais are above.  Did not check.
      -- Exp bonus wears off at zone, dismiss, etc, and shouldn't be handled here, as it also adds to other stats.
   -- Wyvern TP bonus appears to be CurrentTP/1024
   -- Wyvern HP is the wyvern's current HP, Wyvern HP+ gear is any gear other than Brais that increases wyvern HP.
      -- Supposedly unused Wyvern HP+ gear added potency, that is 991 current + unused +50 HP > 991 + no HP+ gear.  I have not seen proof of this though.
   -- Source 1, HB IV multiplier: http://www.bluegartr.com/threads/108543-Wyvern-Breath-Testing?p=5017811&viewfull=1#post5017811
   -- Source 2, Lots of info: http://www.bluegartr.com/threads/108543-Wyvern-Breath-Testing?p=5357018&viewfull=1#post5357018
   -- Source for max HP instead of current: http://www.bluegartr.com/threads/108543-Wyvern-Breath-Testing?p=4995110&viewfull=1#post4995110

   ---------- Deep Breathing ----------
   -- 0 for none
   -- 1 for first merit
   -- 0.25 for each merit after the first
   -- TODO: 0.1 per merit for augmented AF2 (10663 *w/ augment*)
   local deep = 0;
   if (pet:hasStatusEffect(EFFECT_MAGIC_ATK_BOOST) == true) then
      deep = 1+((master:getMerit(MERIT_DEEP_BREATHING)-1)*0.25);
      pet:delStatusEffect(EFFECT_MAGIC_ATK_BOOST);
   end

   local gear = master:getMod(MOD_WYVERN_BREATH)/256; -- Master gear that enhances breath

   local base = math.floor((45/256)*(gear+(pet:getTP()/1024)+deep+1)*(pet:getMaxHP())+42);
   if(target:getHP()+base > target:getMaxHP()) then
      base = target:getMaxHP() - target:getHP(); --cap it
   end
   skill:setMsg(MSG_SELF_HEAL);
   target:addHP(base);
   return base;
end
