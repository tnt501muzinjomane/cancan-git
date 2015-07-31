class DashboardsController < ApplicationController
   
   def index
      
      
      @chart = LazyHighCharts::HighChart.new('graph') do |f|
	  f.title(:text => "Total number of companies registered")
	  f.xAxis(:categories => ["Company statistic"])
	  f.series(:name => "Number of companies", :yAxis => 0, :data => [Company.count()])
	  
	  f.series(:name => "Number of employees", :yAxis => 0, :data => [Employee.count()])
	  f.yAxis [
	    {:title => {:text => "Hello", :margin => 70} },
	    {:title => {:text => "Companies in numbers"}, :opposite => true},
	  ]

	  f.legend(:align => 'right', :verticalAlign => 'top', :y => 75, :x => -50, :layout => 'vertical',)
	  f.chart({:defaultSeriesType=>"column"})
	end

   
   end

end
