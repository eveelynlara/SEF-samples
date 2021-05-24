#include "../SEF/SEF.angelscript"

#include "src/StartScreenState.angelscript"
#include "src/StartScreenLayer.angelscript"
#include "src/OptionsLayer.angelscript"
#include "src/GameState.angelscript"

#include "src/Curtain.angelscript"

void main()
{
	sef::init(720.0f /*virtual height*/, 0xFF222222, @customInitialState);

	sef::options::frameworkPath = "../";
}

sef::BaseState@ customInitialState()
{
	return StartScreenState();
}
