function(){
	tabPanel("About",
		HTML("<h1> XINYI LI (KARA)</h1>
        <p >I am analyzing the data about the bike sharing system of Seattle transportation. I focus on the relationship between using frequency of each station, where people start their trips, and the changing amount of installed and existing docks. There are 34 stations in total, and the average using frequency for each station is nearly 4460 times. I divided stations into two groups, whose using frequencies are above and below the average using frequency. Through analyzing the changing amount of installed and existing docks, I get the conclusion that average using frequencies will not directly affect the amount of the docks, maybe as the indirect impact factor.</p>
		<p>My name is XINYI LI (KARA). I graduated from Burnaby South Secondary School, and I am enrolled in Simon Fraser University currently. I have the excellent communication skills, speaking Mandarin and English fluently. I am outgoing and patient, and I can make the deal with the pressure. </p>"
		),#end of html part 1.
        #Notice that I used double quotes (") above because otherwise it would interfere with
        # the single quote in the word (don't)
        HTML('
        <div style="clear: left;">
        <img src="personalphoto.png" alt=""style="height: 274px; width: 204px; "> </div>
        <p>
        XINYI LI (Kara)<br>
        Student, Statistics and Actuarial Science<br>
        Simon Fraser University<br>
        <a href="https://twitter.com/kara98882143" target="_blank">Twitter</a><br>
        </p>'),#End of html part 2
		value="about"
	)
}
