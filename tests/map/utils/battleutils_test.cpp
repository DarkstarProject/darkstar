#include "../../catch.hpp"
#include "../../fakeit.hpp"
#include "../../../src/map/utils/battleutils.h"
#include "../../../src/map/entities/mobentity.h"
#include "../../../src/map/status_effect_container.h"

using namespace fakeit;

SCENARIO("Stoneskin reduces damage taken", "[HandleStoneskin]") {
    CMobEntity defender;

    GIVEN("A defender without stoneskin") {

        REQUIRE(defender.getMod(MOD_STONESKIN) == 0);

        WHEN("hit with 30 damage") {

            int32 damage = 30;
            int32 result = battleutils::HandleStoneskin(&defender, damage);

            THEN("should take 30 damage") {
                REQUIRE(result == damage);
            }
        }

    }

    GIVEN("A defender with stoneskin") {
        defender.setModifier(MOD_STONESKIN, 100);

        WHEN("hit with 90 damage") {

            int32 damage = 90;
            int32 result = battleutils::HandleStoneskin(&defender, damage);

            THEN("should take 0 damage with weakened stoneskin") {
                REQUIRE(result == 0);
                REQUIRE(defender.getMod(MOD_STONESKIN) == 10);
            }
        }

        WHEN("hit with breaking damage") {

            Mock<CStatusEffectContainer> mock;
            When(OverloadedMethod(mock,DelStatusEffect, bool(EFFECT))).Return(true);

            defender.StatusEffectContainer = &mock.get();

            int32 damage = 101;
            int32 result = battleutils::HandleStoneskin(&defender, damage);

            // clear to avoid double free
            defender.StatusEffectContainer = nullptr;

            THEN("should take 1 damage") {
                REQUIRE(result == 1);

                Verify(OverloadedMethod(mock,DelStatusEffect, bool(EFFECT))).Exactly(Once);

            }
        }

    }

}
