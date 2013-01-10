var app = this.app || {};

app.homepage = function(sp_id){
    //alert('This is home page..')
    $.ajax({
        type: "GET",
        url:"/listbugsperteam/?sprint="+sp_id,
        dataType: 'json',
        
        cache: false,
        success: function(data){
            //alert(data.api);
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                },
                title: {
                    text: 'BUGS PER TEAM in Sprint'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                tooltip: {
                 pointFormat: '{series.name}: <b>{point.y}</b>',
                   percentageDecimals: 1
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            distance: 0,
                            crop: false,
                            formatter: function() {
                                return '<b>'+ this.point.name +'</b>: '+ Math.floor(this.percentage) +' %';
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Team bugs',
                    data: [
                        ['Design',   data.design],
                        ['CMS',       data.cms],
                        ['API',     data.api],
                        ['Contro Panel',     data.cp]
                    ]
                }]
            });
        },
        error: function(){
            alert("This is error");
        }
    });

    $.ajax({
        type: "GET",
        url:"/bugsperjob/?sprint="+sp_id,
        dataType: 'json',
        cache: false,
        success: function(data){
            
            i=0;
            var mydata = new Array();
            var cat = new Array();          
            for(var prop in data) {
                //mydata[i]['name'] = prop;
                val = [data[prop]];
                //cat[i] = [prop];
                mydata[i] = {'name':prop, 'data': val};
                //cat[i] = prop;
                i++;
            }
            
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart2',
                    type: 'column'
                },
                title: {
                    text: 'BUGS PER JOB in Sprint'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: "Sprint Jobs"
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Number of Bugs'
                    }
                },
                legend: {
                    layout: 'vertical',
                    backgroundColor: '#FFFFFF',
                    align: 'left',
                    verticalAlign: 'top',
                    x: 100,
                    y: 70,
                    floating: true,
                    shadow: true
                },
                
                tooltip: {
                    formatter: function() {
                        return  this.y +' bugs';
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                    }
                },
                series: mydata
            });
         },
        error: function(){
            alert("This is error");
        }
    });

    $.ajax({
        type: "GET",
        url:"/bugspermember/?sprint="+sp_id,
        dataType: 'json',
        cache: false,
        success: function(data){
            //console.log(data);
            i=0;
            var mydata = new Array();
            var cat = new Array();          
            for(var prop in data) {
                //mydata[i]['name'] = prop;
                val = [data[prop]];
                //cat[i] = [prop];
                mydata[i] = {'name':prop, 'data': val};
                cat[i] = prop;
                i++;
            }
            
            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart3',
                    type: 'column'
                },
                title: {
                    text: 'BUGS PER MEMBER in Sprint'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                xAxis: {
                categories: [],
                    title: {
                        enabled: true,
                        text: 'Members in this sprint',
                        style: {
                            fontWeight: 'normal'
                        }
                    } 
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Number of Bugs'
                    }
                },
                legend: {
                    layout: 'vertical',
                    backgroundColor: '#FFFFFF',
                    align: 'left',
                    verticalAlign: 'top',
                    x: 100,
                    y: 70,
                    floating: true,
                    shadow: true
                },
                
                tooltip: {
                    formatter: function() {
                        return  this.y +' bugs';
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                    }
                },
                series: mydata
            });
         },
        error: function(){
            alert("This is error");
        }
    });

} // End of app.homepage

app.teampage = function(){
    // ajax call for teamsbug ==============        
    $.ajax({
        type: "GET",
        url:"/bugsperteam/",
        dataType: 'json',
        cache: false,
        success: function(data){

            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                },
                title: {
                    text: 'TOTAL BUGS CREATED BY TEAM'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                tooltip: {
                 pointFormat: '{series.name}: <b>{point.y}</b>',
                   percentageDecimals: 1
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            distance: 0,
                            crop: false,
                            formatter: function() {
                                return '<b>'+ this.point.name +'</b>: '+ Math.floor(this.percentage) +' %';
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Team bugs',
                    data: [
                        ['Design',   data.design],
                        ['CMS',       data.cms],
                        ['API',     data.api],
                        ['Contro Panel',     data.cp]
                    ]
                }]
            });
        },
        error: function(){
            alert("This is error");
        }
    });
    // ENd of ajax call for teamsbug ==============

    // Ajax call for avg bugs per team per sprint
    $.ajax({
        type: "GET",
        url:"/avgbugsperteam/",
        dataType: 'json',
        cache: false,
        success: function(data){
            
            i=0;
            var mydata = new Array();
            var cat = new Array();          
            for(var prop in data) {
                //mydata[i]['name'] = prop;
                val = [data[prop]];
                //cat[i] = [prop];
                mydata[i] = {'name':prop, 'data': val};
                //cat[i] = prop;
                i++;
            }
            //console.log(mydata);

            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart2',
                    type: 'column'
                },
                title: {
                    text: 'AVG BUGS PER JOB BY TEAMS'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: "Sprint Jobs"
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Number of Bugs'
                    }
                },
                legend: {
                    layout: 'vertical',
                    backgroundColor: '#FFFFFF',
                    align: 'left',
                    verticalAlign: 'top',
                    x: 100,
                    y: 70,
                    floating: true,
                    shadow: true
                },
                
                tooltip: {
                    formatter: function() {
                        return  this.y +' bugs';
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                    }
                },
                series: mydata
            });
         },
        error: function(){
            alert("This is error");
        }
    });
    // Ajax call for team performance
    $.ajax({
        type: "GET",
        url:"/teamperformance/",
        dataType: 'json',
        cache: false,
        success: function(data){
            
            var cat = []
            for(i=0; i<data.length; i++){
                cat.push(data[i].sprint)
            }
            //console.log(cat)
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart3',
                    type: 'line',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                },
                xAxis: {
                    categories: cat,
                    title: {
                        enabled: true,
                        text: 'Sprint Release Date',
                        style: {
                            fontWeight: 'normal'
                        }
                    } 
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Teams average bugs'
                    }
                },
                title: {
                    text: 'TEAM PERFORMANCE'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                tooltip: {
                 pointFormat: '{series.name}: <b>{point.y}</b>',
                   percentageDecimals: 1
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: data
            });
        },
        error: function(){
            alert("This is error");
        }
    });

} // End of teampage

app.memberpage = function(){
    //alert('hello member page');

    $.ajax({
        type: "GET",
        url:"/bugsperperson/",
        dataType: 'json',
        cache: false,
        success: function(data){
            i=0;
            var mydata = new Array();
            var cat = new Array();          
            for(var prop in data) {                
                val = data[prop];                
                mydata[i] = [prop,val];                
                i++;
            }
            //console.log(mydata);
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                },
                title: {
                    text: 'TOTAL BUGS CREATED BY INDIVIDUALS'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                tooltip: {
                 pointFormat: '{series.name}: <b>{point.y}</b>',
                   percentageDecimals: 1
                },
                plotOptions: {
                    pie: {
                        allowPointSelect: true,
                        cursor: 'pointer',
                        dataLabels: {
                            enabled: true,
                            color: '#000000',
                            connectorColor: '#000000',
                            distance: 0,
                            crop: false,
                            formatter: function() {
                                return '<b>'+ this.point.name +'</b>: '+ Math.floor(this.percentage) +' %';
                            }
                        }
                    }
                },
                series: [{
                    type: 'pie',
                    name: 'Individual bugs',
                    data: mydata
                }]
            });
        },
        error: function(){
            alert("This is error");
        }
    });
    

    $.ajax({
        type: "GET",
        url:"/avgbugsbyperson/",
        dataType: 'json',
        cache: false,
        success: function(data){
            
            i=0;
            var mydata = new Array();
            var cat = new Array();          
            for(var prop in data) {
                //mydata[i]['name'] = prop;
                val = [parseInt(data[prop])];
                //cat[i] = [prop];
                mydata[i] = {'name':prop, 'data': val};
                //cat[i] = prop;
                i++;
            }
            //console.log(mydata);

            chart = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart2',
                    type: 'column'
                },
                title: {
                    text: 'AVG BUGS PER JOB BY INDIVIDUALS'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                xAxis: {
                    categories: [],
                    title: {
                        text: "Individual Bars"
                    }
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Number of Bugs / Jobs'
                    }
                },
                legend: {
                    layout: 'vertical',
                    backgroundColor: '#FFFFFF',
                    align: 'left',
                    verticalAlign: 'top',
                    x: 100,
                    y: 70,
                    floating: true,
                    shadow: true
                },
                
                tooltip: {
                    formatter: function() {
                        return  this.y +' bugs';
                    }
                },
                plotOptions: {
                    column: {
                        pointPadding: 0.2,
                        borderWidth: 0,
                    }
                },
                series: mydata
            });
         },
        error: function(){
            alert("This is error");
        }
    });


/*   
    $.ajax({
        type: "GET",
        url:"/memberperformance/",
        dataType: 'json',
        cache: false,
        success: function(data){
            
            var cat = []
            for(i=0; i<data.length; i++){
                cat.push(data[i].sprint)
            }
            console.log(cat)
            chart1 = new Highcharts.Chart({
                chart: {
                    renderTo: 'mychart3',
                    type: 'line',
                    plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                },
                xAxis: {
                    categories: cat,
                    title: {
                        enabled: true,
                        text: 'Sprint Release Date',
                        style: {
                            fontWeight: 'normal'
                        }
                    } 
                },
                yAxis: {
                    min: 0,
                    title: {
                        text: 'Teams average bugs'
                    }
                },
                title: {
                    text: 'TEAM PERFORMANCE'
                },
                subtitle: {
                    text: 'Source: QA team'
                },
                tooltip: {
                 pointFormat: '{series.name}: <b>{point.y}</b>',
                   percentageDecimals: 1
                },
                plotOptions: {
                    line: {
                        dataLabels: {
                            enabled: true
                        },
                        enableMouseTracking: false
                    }
                },
                series: data
            });
        },
        error: function(){
            alert("This is error");
        }
    });
*/

}

app.teambugpage = function(sp_id){
    //alert('This is teamsbug page');

    $.ajax({
        type: "GET",
        url:"/teamsbug/?sp_id="+sp_id,
        //dataType: 'html',
        cache: false,
        success: function(data){
            $("#teamsbug").html(data);            
            
        },
        error: function(result){
            alert("This is error");
        }
    });
}

app.individualbugpage = function(sp_id){
    //alert('This is teamsbug page');

    $.ajax({
        type: "GET",
        url:"/individualbugs/?sp_id="+sp_id,
        //dataType: 'html',
        cache: false,
        success: function(data){
            $("#individualbugs").html(data);            
            
        },
        error: function(result){
            alert("This is error");
        }
    });
}

app.init = function(){
    //alert('App initialized...');
    this.homepage(4);
}

$(document).ready(function() {

    //app.init();

    $("ul.home select[name='sprint']").change(function(){
        
        sp_id = $(this).find("option:selected").val();
        app.homepage(sp_id);
    })
    
    $("ul.teambugpage select[name='sprint']").change(function(){
        
        sp_id = $(this).find("option:selected").val();
        app.teambugpage(sp_id);
    })

    $("ul.individualbugpage select[name='sprint']").change(function(){
        
        sp_id = $(this).find("option:selected").val();
        //alert(sp_id);
        app.individualbugpage(sp_id);
    })

    // $("#teamperformance").click(function(e){
    //     e.preventDefault();
    //     app.teampage();

    // })

    // $("#memberperformance").click(function(e){
    //     e.preventDefault();
    //     app.memberpage();

    // })
    

})

    


      




