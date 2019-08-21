<template>
    <hooper :infiniteScroll="true" :itemsToShow="3" :autoPlay="true" :playSpeed="4000" :wheelControl="false" :mouseDrag="false">
        <slide v-for="img in images" :key="img.id" class="hooper-margina">
            <viewer :images="images" :options="{toolbar: false, tooltip: false, title: false, navbar: false}">
                <img class="cursor-pointer" :src="'/img/collections/' + img.image" alt="img">
            </viewer>
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
