/**
 * First we will load all of this project's JavaScript dependencies which
 * includes Vue and other libraries. It is a great starting point when
 * building robust, powerful web applications using Vue and Laravel.
 */

require('./bootstrap');

window.Vue = require('vue');

/**
 * The following block of code may be used to automatically register your
 * Vue components. It will recursively scan this directory for the Vue
 * components and automatically register them with their "basename".
 *
 * Eg. ./components/ExampleComponent.vue -> <example-component></example-component>
 */

// const files = require.context('./', true, /\.vue$/i);
// files.keys().map(key => Vue.component(key.split('/').pop().split('.')[0], files(key).default));

import ConfirmDialog from './components/ConfirmDialog.vue';

Vue.component('confirm-dialog', ConfirmDialog);
Vue.component('variation', require('./components/Variation.vue').default);
Vue.component('flash', require('./components/Flash.vue').default);
Vue.component('product', require('./components/Product.vue').default);
Vue.component('inquiry', require('./components/Inquiry.vue').default);
Vue.component('contact', require('./components/Contact.vue').default);
Vue.component('slider-inspiration', require('./components/SliderInspiration').default);
Vue.component('slider-news', require('./components/SliderNews').default);
Vue.component('slider-main', require('./components/SliderMain').default);
Vue.component('slider-collection', require('./components/SliderCollection').default);
Vue.component('collection-product-slider', require('./components/CollectionProductSlider').default);
Vue.component('collection-option-slider', require('./components/CollectionOptionSlider').default);

/**
 * Next, we will create a fresh Vue application instance and attach it to
 * the page. Then, you may begin adding components to this application
 * or customize the JavaScript scaffolding to fit your unique needs.
 */

const app = new Vue({
    el: '#app',
});
