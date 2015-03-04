class StaticPagesController < ApplicationController
  def home
  end

  def charts
  end

  def upload
    m = params[:file].tempfile.read.split("\n").map{ |i| i.chomp.to_s}

    paz = Neography::Rest.new.create_node( "nome" => params[:pnome], "sesso" => params[:pses], "età" => params[:panni], "malattia" => params[:pmal], "esito" => params[:pdis], "stato" => params[:psta], "data stato" => params[:pstad], "infezione" => params[:inff], "data diagnosi" => params[:dad], "data chemio" => params[:pcdat], "dosi tempi chemio" => params[:pcdos], "trapianto" => params[:trap], "infezione fungina" => params[:inff],"coltura positiva" => params[:col], "esito altro" => params[:pdisa], "data decesso" => params[:pstaa], "data trapianto" => params[:trada], "età donatore" => params[:trage], "sesso donatore" => params[:trasex], "data infezione" => params[:pinfd], "coltura positiva si" => params[:cols], "coltura positiva si altro" => params[:colsa], "galattomannano" => params[:gal], "galattomannano si" => params[:gals], "galattomannano si altro" => params[:galsa], "betaglucano" => params[:bcp], "betaglucano si " => params[:bcps], "PCR positivo" => params[:pcr], "PCR positivo si" => params[:pcrs], "istopatologia positiva" => params[:ist], "istopatologia positiva si" => params[:ists], "istopatologia positiva si altro" => params[:istsa], "identificazione fungo" => params[:idfu], "profilassi antifungina" => params[:paf], "profilassi antifungina dosi" => params[:pafd],  "terapia antifungina" => params[:taf], "terapia antifungina dosi" => params[:tafd], "sierologia CMV paziente" => params[:smcvp],"sierologia CMV donatore" => params[:smcvd], "infezione da CMV" => params[:icmv], "infezione da CMV data" => params[:icmvd], "infezione da virus respiratori" => params[:ivr],  "infezione da virus respiratori altro" => params[:ivra], "profilassi antivirale" => params[:pra], "profilassi antivirale dosi" => params[:prad], "terapia antivirale" => params[:tra], "terapia antivirale dosi" => params[:trad], "infezione batterica" => params[:infba], "infezione batterica data" => params[:infbad], "identificazione specie batterica" => params[:idsb], "profilassi antibatterica" => params[:prab], "profilassi antibatterica dosi" => params[:prabd], "terapia antibatterica" => params[:trab], "terapia antibatterica dosi" => params[:trabd])

    Neography::Rest.new.add_label(paz, "patient")  


    co=m.size
    

m.size.times{ |x|
   	 o=0
	    if x!=0 then
	  	    m[x] = m[x].split(" ")
		    if m[x][46]=="\"Bacteria\"" then
			        45.times{ |y| o=o+m[x][y+1].to_i
					m[x][y+1]=nil }
				m[x]=m[x].compact
			  	m[x] = m[x].join(" ")
			  	m[x] = m[x].split("\" \"")

    				m[x].size.times{ |y|  if m[x][y]=="" || m[x][y]=="environmental samples" || m[x][y]=="\"" then 
					m[x][y]=nil end}
				m[x]=m[x].compact
				m[x][0][0]=''


			    id=nil
			    if m[x].size-1<8 then
			      id=m[x][m[x].size-1].gsub(/(?<=[a-z])(?=[A-Z])/, ' ')
			    else
			      id=m[x][7].gsub(/(?<=[a-z])(?=[A-Z])/, ' ')
			    end

			    if m[x].size-1<7 then
			 	id="Unknown #{id}"
			    end

			Neography::Rest.new.execute_query("MATCH (n:`Species`) WHERE n.name='#{id}'
								WITH n
								CREATE (p:`sample5` {name: '#{id}', count: #{o}})-[:belongs_to]->n
								CREATE paz-[:paz_samp]->p")

		

		    end
	    end
    }  
render :text => "grafo costruito"
  end


end
