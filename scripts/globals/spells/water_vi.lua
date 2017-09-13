++-----------------------------------------
+-- Spell: Water VI
+-- Deals water damage to an enemy.
+-----------------------------------------
+
+require("scripts/globals/magic");
+require("scripts/globals/status");
+
+-----------------------------------------
+-- OnSpellCast
+-----------------------------------------
+
+function onMagicCastingCheck(caster, target, spell)
+    return 0;
+end;
+
+function onSpellCast(caster, target, spell)
+    local spellParams = {};
+    spellParams.hasMultipleTargetReduction = false;
+    spellParams.resistBonus = 1.0;
     spellParams.V0 = 840;
+    spellParams.V50 = 1133;
+    spellParams.V100 = 1419;
+    spellParams.V200 = 1911;
+    spellParams.M0 = 6.57;
+    spellParams.M50 = 5.73;
+    spellParams.M100 = 4.93;
+    spellParams.M200 = 4;

+    return doElementalNuke(caster, spell, target, spellParams);
+end;
