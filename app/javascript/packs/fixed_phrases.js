import Vue from 'vue'

window.addEventListener('DOMContentLoaded', function() {
    new Vue({
        el: '#fixed_phrases',
        data: {
        },
        methods:{
            onClick(e){
                const href = e.srcElement.parentNode.dataset.href
                location.href = href
            }
        }
    })
})