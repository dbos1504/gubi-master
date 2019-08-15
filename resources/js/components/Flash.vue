<template>
    <div class="poza" v-show="show">
        <div class="alert alert-success flash" role="alert">
            <b>{{ body }}</b>
        </div>
    </div>
</template>

<script>
    export default {
        props : ['message'],

        data() {
            return {
                body : '',
                show : false
            }
        },

        created() {
            if (this.message) {
                this.flash(this.message);
            }

            window.events.$on('flash', message => {
                this.flash(message);
            });
        },

        methods: {
            flash(message) {
                this.body = message;
                this.show = true;

                this.hide();
            },

            hide() {
                setTimeout(() => {
                    this.show = false;
                }, 3000)
            }
        }
    }
</script>
<style>
    .flash {
        position: fixed;
        bottom: 30px;
        right: 50px;
        z-index: 9999999;
        font-weight: 700;
    }
    .poza {
        background: rgba(0, 0, 0, 0.35);
        width: 100%;
        height: 100vh;
        top: 0;
        position:fixed;
    }
</style>
