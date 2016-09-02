#tag Class
Protected Class App
Inherits Application
	#tag Property, Flags = &h0
		oauth2 As OAuth2
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"\xE5\x89\x8A\xE9\x99\xA4", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xE5\x89\x8A\xE9\x99\xA4"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"\xE5\x89\x8A\xE9\x99\xA4"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"\xE7\xB5\x82\xE4\xBA\x86", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"\xE7\xB5\x82\xE4\xBA\x86"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="modalOpened"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
