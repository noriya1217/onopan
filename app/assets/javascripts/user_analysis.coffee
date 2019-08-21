# window.draw_graph = -> 
#     ctx = document.getElementById("myChart").getContext('2d')
#     myChart = new Chart(ctx, {
#         type: 'pie',
#         data: {
#             labels: ["Red", "Blue", "Yellow", "Green", "Purple", "Orange"],
#             datasets: [{
#                 label: '# of Votes',
#                 data: [12, 19],
#                 backgroundColor: [
#                     'rgba(255, 99, 132, 1)',
#                     'rgba(54, 162, 235, 1)',
#                     'rgba(255, 206, 86, 1)',
#                     'rgba(75, 192, 192, 1)',
#                     'rgba(153, 102, 255, 1)',
#                     'rgba(255, 159, 64, 1)'
#                 ],
#                 borderColor: [
#                     'rgba(255,99,132,1)',
#                     'rgba(54, 162, 235, 1)',
#                     'rgba(255, 206, 86, 1)',
#                     'rgba(75, 192, 192, 1)',
#                     'rgba(153, 102, 255, 1)',
#                     'rgba(255, 159, 64, 1)'
#                 ],
#                 borderWidth: 1
#             }]
#         },
#         # options: {
#         #     scales: {
#         #         yAxes: [{
#         #             ticks: {
#         #                 beginAtZero:true
#         #             }
#         #         }]
#         #     }
#         # }
#     })