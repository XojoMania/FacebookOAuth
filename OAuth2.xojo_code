#tag Class
Protected Class OAuth2
	#tag Method, Flags = &h0
		Sub constructor(provider as string, clientKey as string, clientSecret as String)
		  Self.provider = provider
		  Self.clientKey = clientKey
		  Self.clientSecret = clientSecret
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getOAuthUrl() As string
		  // return "https://facebook.com"
		  
		  DIm url as string = "https://www.facebook.com/dialog/oauth?client_id="+ self.clientKey +"&response_type=token&redirect_uri=https://www.facebook.com/connect/login_success.html"
		  
		  return url
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function getUserInformation(Optional fields() as String) As JSONItem
		  Dim json as JSONItem
		  Dim http as new HTTPSecureSocket
		  
		  Dim url as string 
		  
		  if fields = nil then
		    fields = Array("id", "name")
		  end if
		  
		  url = "https://graph.facebook.com/me?access_token&fields=" +EncodeURLComponent(join(fields, ",")) + _
		  "&access_token=" + Self.accessToken
		  
		  Try
		    Dim content as String = http.get(url, 5)
		    json = new JSONItem(content)
		  Catch t As UnsupportedOperationException
		    
		  End Try
		  
		  return json
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isComplete(url as string) As Boolean
		  Dim parts() as string = split(url, "#")
		  Dim i as Integer = UBound(parts)
		  
		  if Ubound(parts) < 1 then
		    return false
		  end if
		  
		  
		  parts = split(parts(1), "&")
		  if Ubound(parts) = -1 then
		    return false
		  end if
		  
		  Dim tmpString() as string = split(parts(0), "=")
		  Self.accessToken = tmpString(1)
		  
		  tmpString() = split(parts(1), "=")
		  Self.expired = val(tmpString(1))
		  return true
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		accessToken As String
	#tag EndProperty

	#tag Property, Flags = &h0
		clientKey As string
	#tag EndProperty

	#tag Property, Flags = &h0
		clientSecret As string
	#tag EndProperty

	#tag Property, Flags = &h0
		expired As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		provider As string
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="accessToken"
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="clientKey"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="clientSecret"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="expired"
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="provider"
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
