#include "../SEF/SEF.angelscript"

#include "src/StartScreenState.angelscript"

void main()
{
	sef::init(720.0f /*virtual height*/, 0xFF222222, @customInitialState);
}

sef::BaseState@ customInitialState()
{
	return StartScreenState();
}
