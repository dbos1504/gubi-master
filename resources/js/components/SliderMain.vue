<template>
    <hooper :infiniteScroll="true" :itemsToShow="1" :autoPlay="true" :playSpeed="4000" :wheelControl="false" :mouseDrag="false">
        <slide v-for="img in images" :key="img.id" >
            <viewer :images="images" :options="{toolbar: false, tooltip: false, title: false, navbar: false}">
                <img class="cursor-pointer" :src="'/img/collections/' + img.image" :alt="img.alt">
            </viewer>
            <p v-if="img.short_desc" class="text-sm text-gray-600 text-center mt-4">{{ img.short_desc }}</p>
        </slide>
        <hooper-navigation slot="hooper-addons"></hooper-navigation>
    </hooper>
</template>

<script>
    import { Hooper, Slide, Navigation as HooperNavigation } from 'hooper';
    import 'hooper/dist/hooper.css';
    import 'viewerjs/dist/viewer.css';

    export default {
        props: ['data'],

        components: {
            Hooper,
            Slide,
            HooperNavigation
        },

        data() {
            return {
                images: this.data
            }
        }
    }
</script>
