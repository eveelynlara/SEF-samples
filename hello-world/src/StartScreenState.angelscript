class StartScreenState : sef::BaseState
{
	StartScreenState()
	{
		super("empty", vector2(sef::getFixedHeight() / 2.0f) /*bucketSize*/);

		#if TESTING
			print("Scene \'" + getSceneName() + "\' created with bucket size of " + sef::string::vector2ToString(getBucketSize()));
		#endif
	}

	void onCreated() override
	{
		BaseState::onCreated();
	}

	void onUpdate() override
	{
		BaseState::onUpdate();
	}
}
