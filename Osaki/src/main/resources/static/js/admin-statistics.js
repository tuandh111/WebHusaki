//add chart
document.addEventListener("DOMContentLoaded", function() {
    var labelsRevenueByMonth=null;
    var valuesRevenueByMonth=null;
    var monthColors = [
        'rgb(75, 192, 192)',
          'rgb(255, 205, 86)',
          'rgb(201, 203, 207)',
          'rgb(54, 162, 235)', 
        'rgba(255, 99, 132, 0.5)', 
        'rgba(54, 162, 235, 0.5)',    
        'rgba(255, 206, 86, 0.5)'
       
    ];
    if(dataRevenueByMonth!=null){
        labelsRevenueByMonth = Object.keys(dataRevenueByMonth);
        valuesRevenueByMonth = Object.values(dataRevenueByMonth);
    }
    
    const revenueByMonthChart = document.getElementById('myChartStatisticsByMonth');
    new Chart(revenueByMonthChart, {
        type: 'polarArea',
        data: {
            labels: labelsRevenueByMonth,
            datasets: [{
                label: 'Doanh thu theo tháng',
                data: valuesRevenueByMonth,
                backgroundColor: monthColors,               
                borderWidth: 1
                }]
            },
        options: {
            responsive:true,
        }
    });
    
    
    var labelsRevenueByProduct=null;
    var valuesRevenueByProduct=null;
    var productColors = [
        'rgba(255, 99, 132, 0.5)', 
        'rgba(54, 162, 235, 0.5)',    
        'rgba(255, 206, 86, 0.5)', 
        'rgb(255, 99, 132)',
          'rgb(75, 192, 192)',
          'rgb(255, 205, 86)',
          'rgb(201, 203, 207)',
          'rgb(54, 162, 235)'     
    ];
    if(dataRevenueByProduct!=null){
        labelsRevenueByProduct = Object.keys(dataRevenueByProduct);
        valuesRevenueByProduct = Object.values(dataRevenueByProduct);
    }
    
    const revenueByProductChart = document.getElementById('myChartStatisticsByProduct');
    new Chart(revenueByProductChart, {
        type: 'bar',
        data: {
            labels: labelsRevenueByProduct,
            datasets: [{
                label: 'Doanh thu theo sản phẩm',
                data: valuesRevenueByProduct,
                backgroundColor: productColors,               
                borderWidth: 1
                }]
            },
        options: {
            responsive:true,           
        }
    });
        
});