class StartScreenLayer : sef::UISchedulerLayer
{
	private sef::UIButton@ m_startButton;

	StartScreenLayer()
	{
		super("StartScreenLayer", true /*iterable*/, "start");

		sef::parseLayerFileAndAddTo(GetResourceDirectory() + "layers/StartScreen.layer", this, sef::StaticFont());		

		@m_startButton = cast<sef::UIButton>(getElement("start"));

		LoadSoundEffect("soundfx/button.mp3");
		LoadSoundEffect("soundfx/click.mp3");
	}

	void update() override
	{
		UISchedulerLayer::update();

		if (m_startButton.isPressed())
		{
			#if TESTING
				print("Start button pressed!");
			#endif
		}
	}
}
